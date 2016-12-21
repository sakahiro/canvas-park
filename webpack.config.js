module.exports = {
  entry: {
    app: "./frontend/src/scripts/app.js"
  },
  output: {
    path: "./app/assets/javascripts",
    filename: "[name].bundle.js"
  },
  module: {
    loaders: [
      {
        test: /\.js/,
        loader: "babel"
      }
    ]
  }
}
