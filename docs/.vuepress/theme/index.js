module.exports = {
    plugins: [
        ['@vuepress/pwa', {
            serviceWorker: true,
            updatePopup: true
        }],
        ['@vuepress/medium-zoom', {
            selector: '.portfolio-item-layout .content img'
        }]
    ]
}