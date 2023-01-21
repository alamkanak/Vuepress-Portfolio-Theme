# ViewPress Portfolio Theme
This is a viewpress theme, populated with sample portfolio items. The theme currently supports the plugins: [medium-zoom](https://vuepress.vuejs.org/plugin/official/plugin-medium-zoom.html), [google-analytics](https://vuepress.vuejs.org/plugin/official/plugin-google-analytics.html) and [custom-container](https://vuepress.vuejs.org/guide/markdown.html#custom-containers). The theme is also customizable (see below).

[View demo](https://alamkanak.github.io)

## Setup
1. Clone the repo.
2. Open terminal in the root directory and run
    ```bash
    npm install
    ```
3. Copy the `.env.example` file at the root directory and change all the environment variables
    ```bash
    cp .env.example .env
    nano .env
    ```
4. To run the project you can use one of the following options:
    1. Run the project in docker
        ```bash
        docker-compose up
        ```
    2. Run the project locally
        ```bash
        npm run docs:dev
        ```
5. Your project will be available in https://localhost:8080

## Configure the site
1. Open `docs/.viewpress/config.js`.
2. Edit title, description, favicons, social links etc.
3. Refer to [font-awesome](https://fontawesome.com) library if you want to add custom icons in the social links list.
4. Open `docs/README.md` and edit home page content.

## Add portfolio items
1. In `docs > project` folder add a markdown file for each of your project.
2. You can customize the metadata in the top of the file to customize portfolio item page. Have a look at the sample portfolio items in the repo.

## Advanced: Customize theme color and font
1. Open `docs/.viewpress/theme/style/index.styl` file.
2. At the top of the file, you can see all of the color options that you can modify. Edit them according to your need.

## Deploy to github pages
1. Open `deploy.sh`.
2. Replace all references of `https://github.com/alamkanak/alamkanak.github.io.git` with your repo URL where you want to deploy.
3. Replace all references of `alam` with your local machine user name.
4. To deploy, run one of the following:
    1. If running npm on your local environment:
        ```bash
        sudo sh deploy.sh
        ```
    2. If running on docker:
        ```bash
        # get container ID
        docker ps

        # go into docker terminal
        docker exec -it <container_name> sh

        # setup git
        git config --global user.email "you@example.com"
        git config --global user.name "Your Name"

        # deploy
        sh deploy.sh

        # exit
        exit
        ```
