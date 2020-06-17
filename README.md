# Puppeteer test container

## Build

```
docker build -t croc/puppeteer .
```

## Run

  1. Create a `tests` folder.
  2. write a puppeteer test file under the test folder with `test.js` name
  3. run the container and check the output and/or folder for screenshots
    ```
    docker run -v $PWD/tests/:/tests/ --rm croc/puppeteer
    ```

Do not forget to add write permission on tests folder!


## Info

Check the examples folder in the repo for a short example test file.
... and these URLs for more information :) 
  - https://github.com/puppeteer/puppeteer
  - https://pptr.dev/


Good Luck! :)

