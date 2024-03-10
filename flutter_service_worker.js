'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "6eda6a0160c677c445439e6a27bdbe3b",
"assets/images/end_points_axis_time_series.png": "4d12dc5d5f87fc4f845e9e3c11a338da",
"assets/images/grouped_stacked_bar.png": "8fe8760e9b27d9646872fab7af84d141",
"assets/images/line_annotation_time_series.png": "37cf4205cf7ab976039c923dac44bf9b",
"assets/images/stacked_bar.png": "6e1f5ff42e7afb247c664c3e7b06e4bf",
"assets/images/with_bar_renderer_time_series.png": "644328ba38ba32f6dd0aadc52a9f05ed",
"assets/images/pattern_forward_hatch_bar.png": "9d71b964fc7fc42622c09cf635dc6047",
"assets/images/horizontal_pattern_forward_hatch_bar.png": "5f655adab3ebb3a2a8eab08037c83455",
"assets/images/stacked_fill_color_bar.png": "7e592b6fc0d827c6979a1c3c2d38a338",
"assets/images/custom_rounded_bars_bar.png": "42f4b1d4318e7622517b5a617b490be4",
"assets/images/confidence_interval_time_series.png": "390fec07577178b5d7a28ef2df852965",
"assets/images/simple_time_series.png": "6958558f61facdf22339a77439179658",
"assets/images/horizontal_bar_label_custom_bar.png": "3c5a6463af0afbc2165d2e655422e4a7",
"assets/images/range_annotation_time_series.png": "d96a6ae1d2c59b73a16c654c8b15b6a2",
"assets/images/simple_bar.png": "8befd9080cd91ec469a89b1ac3810798",
"assets/images/symbol_annotation_time_series.png": "a802181ab91d40b0e3f7e5ca2d009f18",
"assets/images/horizontal_bar_label_bar.png": "a23cd530623efdbe4eae29a442c254fd",
"assets/images/grouped_target_line_bar.png": "05f18cf8bfbfd4f8438324860ea5d43c",
"assets/images/spark_bar.png": "4e9d465bccfe64d163f3bea34f5714b8",
"assets/images/grouped_bar.png": "ffb17f59bfbfb92450793ab374a1cabb",
"assets/images/grouped_fill_color_bar.png": "45d81c13671abcba9311abcfc91e160c",
"assets/images/vertical_bar_label_bar.png": "1d023da153e6d3acb8551791ceda2aea",
"assets/images/horizontal_bar.png": "1a729a66b681f7fa8274acd1e3b0ab3e",
"assets/images/range_annotation_margin_time_series.png": "215a2bc4399176330335b6864eb1bb01",
"assets/images/grouped_stacked_weight_pattern_bar.png": "0766d7ac4cc875f9e718ce057471da77",
"assets/AssetManifest.bin.json": "e46323a1c0b268b263945228586081bb",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "15d12d9806dcb10a75c687d4733a38f6",
"assets/lib/examples/simple_time_series.dart": "515a38c586998ddc15542bf47d5cf1ca",
"assets/lib/examples/pattern_forward_hatch_bar.dart": "0636299bd87b5f04b1f32381591608cb",
"assets/lib/examples/with_bar_renderer_time_series.dart": "9f1b1e925ca0058b6ac605b2a2934646",
"assets/lib/examples/stacked_fill_color_bar.dart": "e68e70513428768408717ec88bbd6910",
"assets/lib/examples/vertical_bar_label_bar.dart": "2cae6226c7a9890ad4c5eb24e3eb819a",
"assets/lib/examples/grouped_bar.dart": "958fe5d4e6fa4b10ae3b569bbc3d8822",
"assets/lib/examples/horizontal_bar_label_bar.dart": "fec08782353568ec2893e38afedc7b1b",
"assets/lib/examples/symbol_annotation_time_series.dart": "fa7d1f1bf19d463bad0709c5ec340531",
"assets/lib/examples/stacked_bar.dart": "97d03b56ae2ef4082e7747e9aa8ab91e",
"assets/lib/examples/confidence_interval_time_series.dart": "fbc609f17f85fb1c09fdb78275d9b935",
"assets/lib/examples/horizontal_bar_label_custom_bar.dart": "6181ef2710b4bcd3ad2a32a5e5165df7",
"assets/lib/examples/simple_bar.dart": "8a69ed179dd5dbada51ed1ba69e7a56a",
"assets/lib/examples/spark_bar.dart": "33108efd9f9e7a049e1c96b51f412a47",
"assets/lib/examples/range_annotation_margin_time_series.dart": "da29f042723cbca25b969f7ce1d2af99",
"assets/lib/examples/grouped_target_line_bar.dart": "41793f95779e329cc0e77ff2c4b7a7b1",
"assets/lib/examples/grouped_stacked_bar.dart": "7d6df0ece5ca18b5e7127d95a1e7628a",
"assets/lib/examples/grouped_stacked_weight_pattern_bar.dart": "fc62159127646e569981344b784f7473",
"assets/lib/examples/range_annotation_time_series.dart": "234265711deb64547f3664cf4ba425f1",
"assets/lib/examples/end_points_axis_time_series.dart": "f22f90211d32f66d026516c4e3504a5b",
"assets/lib/examples/horizontal_pattern_forward_hatch_bar.dart": "760a2daa04658154de420c2ee52e5a5c",
"assets/lib/examples/custom_rounded_bars_bar.dart": "07b705d2a7d92befdc224a7b23b05f7e",
"assets/lib/examples/horizontal_bar.dart": "74ef3c635091409984f91c3396c94c52",
"assets/lib/examples/line_annotation_time_series.dart": "f110333247dd1be607cf2ab285c16b54",
"assets/lib/examples/grouped_fill_color_bar.dart": "019c557bf10a601bac234262902efee8",
"assets/AssetManifest.json": "0a697faccf7f6de87c385ac37a1b91f7",
"assets/fonts/MaterialIcons-Regular.otf": "f912a0db0d6159f5becb7a6da55541bb",
"assets/fonts/Source_Code_Pro/SourceCodePro-Italic-VariableFont_wght.ttf": "59b5238c0c1acf946ebea93fc3862987",
"assets/fonts/Source_Code_Pro/SourceCodePro-VariableFont_wght.ttf": "2eabf19db936c3a7603eaa08dce63e6b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/FontManifest.json": "2f53ef7bc35c3d35dee278dd9d003d24",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"version.json": "fb15ba94942f3245c9913d95febed82f",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"manifest.json": "9553833f7814f6253fa0b6a1da2b1f36",
"index.html": "9158b59c9152a4daa4b9ee16ac42bd90",
"/": "9158b59c9152a4daa4b9ee16ac42bd90",
"main.dart.js": "8dde4c8eaaa3bb024e8c83639b1c02ae"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
