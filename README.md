# kscript from docker
A quick way to play with `kscript` without having to install it.

### How?
After building a docker image that contains java, kotlin and kscript it uses it to execute the provided `code` or `.kts file` inside a container.

You can use `kscript` in every way described [here](https://github.com/holgerbrandl/kscript#script-input-modes)

##### kscript-router.sh
To make sure all cases from the aforementioned link are supported, the input is being given to a bash script that then decides how to run the container.

### Installation
Clone this repository and inside the folder that was cloned run:
```bash
> chmod +x install.sh
> ./install.sh
```

This will:
1. Build a docker image that has java, kotlin and kscript installed
2. Make `kscript-router` executable
3. Add it to the current user's PATH
4. Create an alias for it _(kscript = kscript-router)_
