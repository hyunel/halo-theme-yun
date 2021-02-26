const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
// const dev = process.env.NODE_ENV === 'development';
let dev = false;

module.exports = {
    mode: dev ? 'development' : 'production',
    entry: path.resolve(__dirname, 'source', '.dev', 'js', 'main.js'),
    output: {
        path: path.resolve(__dirname, 'source', 'js'),
        filename: "main.js"
    },
    devtool: 'source-map',
    // optimization: {
    //     minimize: false
    // },
    plugins: [
        new MiniCssExtractPlugin({
          filename: '../css/style.css',
        }),
    ],
    module: {
        rules: [
            {
                test: /\.m?js$/,
                exclude: /(node_modules|bower_components)/,
                use: { loader: 'babel-loader'}
            },
            {
                test: /\.scss$/i,
                use: [
                    MiniCssExtractPlugin.loader,
                    {loader:  'css-loader', options: {
                        importLoaders: 2,
                        url: false
                    }},
                    'postcss-loader',
                    'sass-loader'
                ],
            }
        ]
    },
    resolve: {
        fallback: {
            "fs": false,
            "path": false,
            "os": false,
            "crypto": false,
            "stream": false,
            "http": false,
            "tls": false,
            "zlib": false,
            "https": false,
            "net": false,
            "worker_threads": false
        },
        extensions : ['.js', '.ts']
    }
}