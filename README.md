# ViewPress Portfolio Theme
This is a viewpress theme, populated with sample portfolio items. The theme currently supports the plugins: [medium-zoom](https://vuepress.vuejs.org/plugin/official/plugin-medium-zoom.html), [google-analytics](https://vuepress.vuejs.org/plugin/official/plugin-google-analytics.html) and [custom-container](https://vuepress.vuejs.org/guide/markdown.html#custom-containers). The theme is also customizable (see below).

[View demo](https://alamkanak.github.io)

## Setup
1. Clone the repo.
2. Open terminal in the root directory and run
    ```
    npm install
    ```
3. Create `.env` file at the root directory and add Google Analytics tracking ID
    ```
    GOOGLE_ANALYTICS_TRACKING_ID=<YOUR TRACKING ID>
    ```
4. To run the project on development environment, run
    ```
    npm run docs:dev
    ```

## Configure the site
1. Open `docs/.viewpress/config.js`.
2. Edit title, description, favicons, social links etc.
3. Refer to [font-awesome](https://fontawesome.com) library if you want to add custom icons in the social links list.

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
4. To deploy, run
    ```
    sudo sh deploy.sh
    ```
