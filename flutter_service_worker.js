'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "3e4a173a3af777b6f289a3266b52f6a2",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/LICENSE": "0ec45936059c8a2b4ca3a67a1a2725ad",
"assets/character_images/ypose_hokuma.png": "8d94cbfaa5e0c33f02b53ce35dab3574",
"assets/character_images/neutral_hokuma.png": "1e1b69db9db9f4659e0e2bb5c9c0b3b4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/story/1/hokuma.jpg": "da4cb011fdae64db030c5c7cb747dacd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "10650a18edaf253be7032f884bc3da07",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"index.html": "07d0d17dd340b9d7d5c3a22fd5ad12f6",
"/": "07d0d17dd340b9d7d5c3a22fd5ad12f6"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
