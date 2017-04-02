# Install Node and NPM

    opkg update
    opkg install nodejs npm

I like to store my global node modules in my root directory, so as to not take up too much room in the root file system, this along with my instructions above for setting up SDCARD for `/root` gives me plenty of extra space.

    mkdir -p /root/node/bin
    npm config set prefix /root/node

Add the node bin to your `.profile`, either edit it or echo to it.

    echo "export PATH=~/node/bin:\$PATH" >> ~/.profile
    source ~/.profile

Test it out.

    npm install -g lorem-ipsum
    lorem-ipsum
    # should output some lorem ipsum text
    npm remove -g lorem-ipsum
