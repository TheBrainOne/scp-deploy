# Simple repository deployment to server

A simple GitHub Action that deploy files to a remote server via SCP

### Inputs
  * `local_path` - [__Required__] Path to the file or folder in the repository which do you want to deploy.
  * `server_path`- [__Required__ ] Path on the server where you want to deploy.
  * `host` - [__Required__] Host name or IP address of your server.
  * `port` - SSH port on the your server (leave empty if the port is 22 by default).
  * `username` - [__Required__] Username through which you want to connect to the server.
  * `ssh_key` - [__Required__] Private SSH key created for the user of the above.
### Usage
* Copy and paste the code below
```yml
name: CI

on: 
  push:
    branches: [ master ]
  
jobs:

  build:
    name: Build
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v2
      
      - name: Deploying project to Digital Ocean/production
        uses: TheBrainOne/scp-deploy@master
        with:
          local_path: "./*"
          server_path: ${{ secrets.REMOTE }}
          host: ${{ secrets.HOST }}
          port: ${{ secrets.PORT }}
          username: ${{ secrets.USER }}
          ssh_key: ${{ secrets.KEY }}
```
### How to create SSH key

todo