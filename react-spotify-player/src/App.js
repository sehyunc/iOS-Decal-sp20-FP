import React from "react";
import "./App.css";
import axios from "axios";

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      token: "",
      deviceId: "",
      loggedIn: false,
      error: "",
      trackName: "Track Name",
      artistName: "Artist Name",
      albumName: "Album Name",
      playing: false,
      position: 0,
      duration: 0,
      uri: "spotify:track:20VD8Q5doO3dEQ3bbYxtSp",
      qToken:
        "BQDznQuRLFEoBfJSYGkUH-UiTrWOdMLygFUHXxmFnXFpo-NWrlFytS2AtUVhpve_ijPUaszJILOfHWwdJ7ulVU3LkkZaT8E872ho6_FRe4d59ZvoRU3WAoa81h79cjDQ7IBkTLptTbYQuNqYTJm0AOLdpeO3tTBQZ8EazwNocR1IUu3rhucCc21Hjg",
      topArtists: "",
    };
    this.playerCheckInterval = null;
  }

  componentWillMount() {
    this.getTopArtists();
  }

  checkForPlayer() {
    const { token } = this.state;

    if (window.Spotify !== null) {
      clearInterval(this.playerCheckInterval);
      this.player = new window.Spotify.Player({
        name: "Andu is a Queerio",
        getOAuthToken: (cb) => {
          cb(token);
        },
      });
      this.createEventHandlers();

      // finally, connect!
      this.player.connect();
    }
  }

  createEventHandlers() {
    this.player.on("initialization_error", (e) => {
      console.error(e);
    });
    this.player.on("authentication_error", (e) => {
      console.error(e);
      this.setState({ loggedIn: false });
    });
    this.player.on("account_error", (e) => {
      console.error(e);
    });
    this.player.on("playback_error", (e) => {
      console.error(e);
    });

    // Playback status updates
    this.player.on("player_state_changed", (state) =>
      this.onStateChanged(state)
    );

    // Ready
    this.player.on("ready", (data) => {
      let { device_id } = data;
      console.log("Let the music play on!");
      this.setState({ deviceId: device_id });
      console.log("Device ID: " + this.state.deviceId);
      //this.transferPlaybackHere();
    });
  }

  handleLogin() {
    if (this.state.token !== "") {
      this.setState({ loggedIn: true });
      this.playerCheckInterval = setInterval(() => this.checkForPlayer(), 1000);
    }
  }

  onAddQueue() {
    const { uri, token } = this.state;
    const options = {
      headers: {
        authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
    };
    axios
      .post(
        "https://api.spotify.com/v1/me/player/queue?uri=" + uri,
        null,
        options
      )
      .then(
        (response) => {
          console.log("added to playlist: " + uri);
        },
        (error) => {
          console.log(error);
          console.log("error: " + token);
        }
      );
  }

  getTopArtists() {
    const { qToken } = this.state;
    const options = {
      headers: {
        authorization: `Bearer ${qToken}`,
        "Content-Type": "application/json",
      },
    };
    axios
      .get(
        "https://api.spotify.com/v1/me/top/artists?time_range=short_term&limit=10",
        options
      )
      .then((response) => response.data)
      .then((data) => {
        this.setState({ topArtists: data["items"] });
        console.log(this.state.topArtists);
      });
  }

  // fetchQueue() {
  //   const { uri, token } = this.state;
  //   fetch("https://api.spotify.com/v1/me/player/queue?uri=" + uri, {
  //     method: "POST",
  //     headers: {
  //       accept: "application/json",
  //       "content-type": "application/json",
  //       authorization: "Bearer " + token,
  //     },
  //     body: false,
  //   })
  //     .then((response) => {
  //       console.log(response);
  //     })
  //     .catch((err) => {
  //       console.log(err);
  //     });
  // }

  onPrevClick() {
    this.player.previousTrack();
  }

  onPlayClick() {
    this.player.togglePlay();
  }

  onNextClick() {
    this.player.nextTrack();
  }

  onStateChanged(state) {
    // if we're no longer listening to music, we'll get a null state.
    if (state !== null) {
      const {
        current_track: currentTrack,
        position,
        duration,
      } = state.track_window;
      const trackName = currentTrack.name;
      const albumName = currentTrack.album.name;
      const artistName = currentTrack.artists
        .map((artist) => artist.name)
        .join(", ");
      const playing = !state.paused;
      this.setState({
        position,
        duration,
        trackName,
        albumName,
        artistName,
        playing,
      });
    }
  }

  transferPlaybackHere() {
    const { deviceId, token } = this.state;
    const options = {
      headers: {
        authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
    };
    const data = { device_ids: [deviceId], play: true };
    axios.put("https://api.spotify.com/v1/me/player", data, options).then(
      (response) => {
        console.log(response);
      },
      (error) => {
        console.log(error);
      }
    );
  }

  // transferPlaybackHere() {
  //   const { deviceId, token } = this.state;
  //   fetch("https://api.spotify.com/v1/me/player", {
  //     method: "PUT",
  //     headers: {
  //       authorization: `Bearer ${token}`,
  //       "Content-Type": "application/json",
  //     },
  //     body: JSON.stringify({
  //       device_ids: [deviceId],
  //       play: true,
  //     }),
  //   });
  // }

  render() {
    const {
      token,
      loggedIn,
      artistName,
      trackName,
      albumName,
      error,
      position,
      duration,
      playing,
    } = this.state;

    return (
      <div className="App">
        <div className="App-header">
          <h2>Now Playing</h2>
          <p>Spotify Receiver</p>
        </div>

        {error && <p>Error: {error}</p>}

        {loggedIn ? (
          <div>
            <p>Artist: {artistName}</p>
            <p>Track: {trackName}</p>
            <p>Album: {albumName}</p>
            <p>
              <button onClick={() => this.onPrevClick()}>Previous</button>
              <button onClick={() => this.onPlayClick()}>
                {playing ? "Pause" : "Play"}
              </button>
              <button onClick={() => this.onNextClick()}>Next</button>
            </p>
            <p>
              <button onClick={() => this.onAddQueue()}>Add to Queue</button>
            </p>
            <p>
              <button onClick={() => this.getTopArtists()}>
                Get Top Artists
              </button>
            </p>
            <ul>
              <li>Top Artists</li>
              {this.state.topArtists.map((s) => (
                <li>{s["name"]}</li>
              ))}
            </ul>
          </div>
        ) : (
          <div className="Player">
            <p className="App-intro">
              Enter Spotify access token.{" "}
              <a href="https://beta.developer.spotify.com/documentation/web-playback-sdk/quick-start/#authenticating-with-spotify">
                Get
              </a>
            </p>
            <p>
              <input
                className="tokenInput"
                type="text"
                value={token}
                onChange={(e) => this.setState({ token: e.target.value })}
              />
            </p>
            <p>
              <button
                className="tokenButton"
                onClick={() => this.handleLogin()}
              >
                Go
              </button>
            </p>
          </div>
        )}
      </div>
    );
  }
}

export default App;
