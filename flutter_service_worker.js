'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "2df742f725ff31b80d938f10328aeb6c",
"assets/images/end_points_axis_time_series.png": "4d12dc5d5f87fc4f845e9e3c11a338da",
"assets/images/sliding_viewport_on_selection_behaviors.png": "63b0ff1276540cf8643a9cc8fe42853c",
"assets/images/grouped_stacked_bar.png": "8fe8760e9b27d9646872fab7af84d141",
"assets/images/initial_hint_animation_behaviors.png": "abf01f82fd748feaedcf016cae8bdb1c",
"assets/images/slider_behaviors.png": "464db4c9d4a9e220658c33b688183f69",
"assets/images/line_annotation_time_series.png": "37cf4205cf7ab976039c923dac44bf9b",
"assets/images/stacked_bar.png": "6e1f5ff42e7afb247c664c3e7b06e4bf",
"assets/images/percent_of_domain_interactions.png": "0e6a566bd665d4a7ced34eb81afdf0c9",
"assets/images/with_bar_renderer_time_series.png": "644328ba38ba32f6dd0aadc52a9f05ed",
"assets/images/pattern_forward_hatch_bar.png": "9d71b964fc7fc42622c09cf635dc6047",
"assets/images/numeric_line_bar_combo.png": "342376a7b0f718e1077e9c4c630de283",
"assets/images/default_hidden_series_legend.png": "cfe5c5e70470bd2f5c66f73aeb783c2a",
"assets/images/custom_axis_tick_formatters.png": "eb6ca7d8d27c1b6e240cc4340f5a3ec3",
"assets/images/legend_custom_symbol.png": "07867fc2e3d3a259e03d362fd754c6a8",
"assets/images/horizontal_pattern_forward_hatch_bar.png": "5f655adab3ebb3a2a8eab08037c83455",
"assets/images/initial_selection_interactions.png": "47d5956874c2a19a49dd7ee8727fc603",
"assets/images/stacked_fill_color_bar.png": "7e592b6fc0d827c6979a1c3c2d38a338",
"assets/images/custom_rounded_bars_bar.png": "42f4b1d4318e7622517b5a617b490be4",
"assets/images/area_and_line_line.png": "dd9b1bb3bbf3d9003ff34da32b606892",
"assets/images/confidence_interval_time_series.png": "390fec07577178b5d7a28ef2df852965",
"assets/images/stacked_area_custom_color_line.png": "68160bfb26e54c8fa24738ef3655a870",
"assets/images/simple_time_series.png": "6958558f61facdf22339a77439179658",
"assets/images/stacked_area_line.png": "04bef32db47c1ac93afe4f522d1effee",
"assets/images/horizontal_bar_label_custom_bar.png": "3c5a6463af0afbc2165d2e655422e4a7",
"assets/images/ordinal_bar_line_combo.png": "098a6efb61c6a91c4f4fc2c61d87bb82",
"assets/images/scatter_plot_line_combo.png": "1d3107273ac6416aabbacc0f1bf8d20f",
"assets/images/range_annotation_time_series.png": "d96a6ae1d2c59b73a16c654c8b15b6a2",
"assets/images/percent_of_domain_by_category_interactions.png": "aa2331f9708b4d18d28af732b44d6cda",
"assets/images/selection_callback_example_interactions.png": "ec23ce9ee25df681fbe32702f534bce5",
"assets/images/simple_bar.png": "8befd9080cd91ec469a89b1ac3810798",
"assets/images/selection_bar_highlight_interactions.png": "b3421ed7f9f7b80f603b4c824e920a31",
"assets/images/Dropped%2520image.png": "22b96d0bf0b7c142e6a38f40ff0ee18e",
"assets/images/simple_series_legend_legends.png": "b4b332e44376f7e8a566566fb3161b5b",
"assets/images/points_line.png": "cddec7b3b46457e8044538f20e852f3e",
"assets/images/symbol_annotation_time_series.png": "a802181ab91d40b0e3f7e5ca2d009f18",
"assets/images/horizontal_bar_label_bar.png": "a23cd530623efdbe4eae29a442c254fd",
"assets/images/simple_line.png": "22b96d0bf0b7c142e6a38f40ff0ee18e",
"assets/images/grouped_target_line_bar.png": "05f18cf8bfbfd4f8438324860ea5d43c",
"assets/images/legend_with_measures.png": "a52515f77e3f26a3ee5af3211a315540",
"assets/images/numeric_line_point_combo.png": "5705d87b28faeb1afabd9015153efd42",
"assets/images/spark_bar.png": "4e9d465bccfe64d163f3bea34f5714b8",
"assets/images/grouped_bar.png": "ffb17f59bfbfb92450793ab374a1cabb",
"assets/images/selection_line_highlight_behaviors.png": "3069ed66a82653aa8dde79f17f188f5c",
"assets/images/grouped_fill_color_bar.png": "45d81c13671abcba9311abcfc91e160c",
"assets/images/selection_user_managed_behaviors.png": "74219bb157e5595072ba59b5ffce8625",
"assets/images/vertical_bar_label_bar.png": "1d023da153e6d3acb8551791ceda2aea",
"assets/images/chart_title_behaviors.png": "0c0c65b2eab5b58d7b9c8c3dceceee65",
"assets/images/horizontal_bar.png": "1a729a66b681f7fa8274acd1e3b0ab3e",
"assets/images/legend_options_legends.png": "9346f7f2be04974f3ad2eea8306115e0",
"assets/images/range_annotation_margin_time_series.png": "215a2bc4399176330335b6864eb1bb01",
"assets/images/grouped_stacked_weight_pattern_bar.png": "0766d7ac4cc875f9e718ce057471da77",
"assets/images/percent_of_series_interactions.png": "206bb984b13c2c383e0436f85570564b",
"assets/AssetManifest.bin.json": "65547e6988b4051fd7a6bcf9b64b0222",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "15d12d9806dcb10a75c687d4733a38f6",
"assets/lib/examples/numeric_line_bar_combo.dart": "ff938fa6304ee1e435cb6fcaaeff6d12",
"assets/lib/examples/simple_time_series.dart": "515a38c586998ddc15542bf47d5cf1ca",
"assets/lib/examples/simple_series_legend_legends.dart": "f2bf6da35bda40bab245e4a236c326bc",
"assets/lib/examples/legend_custom_symbol.dart": "27d8b5f0821bd323379bbd5f7a9f3032",
"assets/lib/examples/percent_of_domain_interactions.dart": "968772f6deb7d09668778140250b1fb0",
"assets/lib/examples/pattern_forward_hatch_bar.dart": "0636299bd87b5f04b1f32381591608cb",
"assets/lib/examples/points_line.dart": "33029dc264d8b7cafa5f0ded2bea89ee",
"assets/lib/examples/percent_of_domain_by_category_interactions.dart": "e99b86167c8034a2360d40a74b5d8363",
"assets/lib/examples/selection_callback_example_interactions.dart": "4b6c01c7f6effbb1e5420b04d4093c49",
"assets/lib/examples/selection_line_highlight_behaviors.dart": "8789dc1c997247bf3b1aefee1c15b0aa",
"assets/lib/examples/with_bar_renderer_time_series.dart": "9f1b1e925ca0058b6ac605b2a2934646",
"assets/lib/examples/stacked_fill_color_bar.dart": "e68e70513428768408717ec88bbd6910",
"assets/lib/examples/vertical_bar_label_bar.dart": "2cae6226c7a9890ad4c5eb24e3eb819a",
"assets/lib/examples/grouped_bar.dart": "958fe5d4e6fa4b10ae3b569bbc3d8822",
"assets/lib/examples/horizontal_bar_label_bar.dart": "fec08782353568ec2893e38afedc7b1b",
"assets/lib/examples/symbol_annotation_time_series.dart": "fa7d1f1bf19d463bad0709c5ec340531",
"assets/lib/examples/custom_axis_tick_formatters.dart": "99499fb2fd0193a31fc81a94b6dbaff7",
"assets/lib/examples/stacked_bar.dart": "97d03b56ae2ef4082e7747e9aa8ab91e",
"assets/lib/examples/confidence_interval_time_series.dart": "fbc609f17f85fb1c09fdb78275d9b935",
"assets/lib/examples/horizontal_bar_label_custom_bar.dart": "6181ef2710b4bcd3ad2a32a5e5165df7",
"assets/lib/examples/area_and_line_line.dart": "1f26265c7e5ab20ce694d0bf8f70cb9f",
"assets/lib/examples/selection_user_managed_behaviors.dart": "633c8a371a46243bb9d9d3420388c5ca",
"assets/lib/examples/simple_bar.dart": "8a69ed179dd5dbada51ed1ba69e7a56a",
"assets/lib/examples/spark_bar.dart": "33108efd9f9e7a049e1c96b51f412a47",
"assets/lib/examples/range_annotation_margin_time_series.dart": "da29f042723cbca25b969f7ce1d2af99",
"assets/lib/examples/percent_of_series_interactions.dart": "6b585e5fdaffd6902a1429fb06fa42e4",
"assets/lib/examples/numeric_line_point_combo.dart": "0de319b5fdbf2bdfcd14db124763d810",
"assets/lib/examples/grouped_target_line_bar.dart": "41793f95779e329cc0e77ff2c4b7a7b1",
"assets/lib/examples/grouped_stacked_bar.dart": "7d6df0ece5ca18b5e7127d95a1e7628a",
"assets/lib/examples/legend_with_measures.dart": "0ad689d4cde35e70a364b1e146601de1",
"assets/lib/examples/initial_selection_interactions.dart": "db3ff37080ee8142a6b4f97a19b53b26",
"assets/lib/examples/chart_title_behaviors.dart": "5c3b9ef1e6e65ab6b0e04573da0387d1",
"assets/lib/examples/ordinal_bar_line_combo.dart": "1c23340081391e8aef42ef8b9be7b4a0",
"assets/lib/examples/stacked_area_custom_color_line.dart": "6cbd6278f3975cef59244fb9fff04486",
"assets/lib/examples/slider_behaviors.dart": "6f8360ede24587eaadcbd7c1f73ef3fb",
"assets/lib/examples/grouped_stacked_weight_pattern_bar.dart": "fc62159127646e569981344b784f7473",
"assets/lib/examples/scatter_plot_line_combo.dart": "21fe2c4b8e3610c32fe1a60355b5fb08",
"assets/lib/examples/default_hidden_series_legend.dart": "b6b98e38389482535242612ed188fe84",
"assets/lib/examples/legend_options_legends.dart": "58c0713ce6f15357dcf04f3add4407ba",
"assets/lib/examples/range_annotation_time_series.dart": "234265711deb64547f3664cf4ba425f1",
"assets/lib/examples/stacked_area_line.dart": "fce840322ca3eb9518e26195b2146381",
"assets/lib/examples/end_points_axis_time_series.dart": "f22f90211d32f66d026516c4e3504a5b",
"assets/lib/examples/horizontal_pattern_forward_hatch_bar.dart": "760a2daa04658154de420c2ee52e5a5c",
"assets/lib/examples/simple_line.dart": "0658a1b84157548aab48cd2d7f57e5fa",
"assets/lib/examples/sliding_viewport_on_selection_behaviors.dart": "21dbdab4b423f1d0b6f78320c6e7e714",
"assets/lib/examples/initial_hint_animation_behaviors.dart": "3288dbc06346ca3e820879390ea5547d",
"assets/lib/examples/custom_rounded_bars_bar.dart": "07b705d2a7d92befdc224a7b23b05f7e",
"assets/lib/examples/horizontal_bar.dart": "74ef3c635091409984f91c3396c94c52",
"assets/lib/examples/line_annotation_time_series.dart": "f110333247dd1be607cf2ab285c16b54",
"assets/lib/examples/selection_bar_highlight_interactions.dart": "52b656c77c7cb2e358abe43db742bbe5",
"assets/lib/examples/grouped_fill_color_bar.dart": "019c557bf10a601bac234262902efee8",
"assets/AssetManifest.json": "1e298edf82e47f75304633375a5aed9a",
"assets/fonts/MaterialIcons-Regular.otf": "093e97127c696ec11e998c8cdd79ae5c",
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
"index.html": "7ffea6f3242a96636cac0595995fd579",
"/": "7ffea6f3242a96636cac0595995fd579",
"main.dart.js": "193790b4f19de590041248e800737c9f"};
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
