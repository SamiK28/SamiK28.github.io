'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "5ca3a8592f4a0388f497fbdd6eb056de",
".git/config": "3c6b823f25abb9a2c6668ed3572eb1ed",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ecbb0cb5ffb7d773cd5b2407b210cc3b",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "e4db8c12ee125a8a085907b757359ef0",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/index": "2c9ac7a6ba9dde1349afabdb8b4563f7",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "d340f1c6698c5e01ee545e3819950bf1",
".git/logs/refs/heads/main": "2fca328d7d238f3615d1d51263b5142f",
".git/logs/refs/remotes/origin/main": "30c89ed522d7418bf7b456b64d7fdabe",
".git/objects/0f/bbbf55dc2b6cb3c5d36ea88285345ba8f04f3b": "869b322629d8f5b5bed3f959f17cba78",
".git/objects/0f/d535e9fbf35af7b6b94b7cc66ad34e175eb30a": "6f456b8ca725c1d8c84f6612739cbbd8",
".git/objects/1a/8fe6413935ea635921bc35151bd3ea69c22e88": "19e60f5bc6222b1b9323c8f1c22f3eab",
".git/objects/1c/6d9c9b62f1851ca6a454fc3455bb924b77b4be": "1c8843ec5841b577c0d6c088bbaa06ef",
".git/objects/2a/50ecf75e5354eedc4f83a14932763a66623bef": "356d9feb8546c501993e8f6df66dd821",
".git/objects/2d/0b0b93071728c78e6e3f0716b05d8819905c51": "1e0256ed76f1f2943613ad513ac2436a",
".git/objects/31/ea1639618800fb93e6f998f0a9ea747089386c": "dd32d1d62e934d8c740c778716029ebe",
".git/objects/43/46e2d9e671bf7a5a3287a3ddacf5f915a35d4f": "41b3d0d418188d18de1ec7daf79f5299",
".git/objects/49/133379e7f803c60e4360a97bb3b2fcc041475c": "baa6f01df91de3b5ac0ab28b72385653",
".git/objects/4c/57a4c8755373a911bfc4296483ed3f137dca6a": "adb5cff767672600c9b821d24845bf97",
".git/objects/4c/95b406eeef2878bbca6669d74ea11eb877020b": "f8d1c2b2da51cd6714043ddab429063c",
".git/objects/50/25891f2fcc6f64de17c96a4a355492267312bf": "0ab45c8894243bc5f190040d66f0dcfa",
".git/objects/57/b1280ef00fde869da0c3c406119d336f4b56be": "08a30826683e4122d3ef7e0887b44a61",
".git/objects/5c/f0ce660e7c38e62db36ad1d0d00734bce81f00": "511a6176a1976be6820c043baf028be7",
".git/objects/5c/fbae1e414394d37f4b9e665ffba2852e7ac138": "eff1a99b44cd3e31fba44b70349430d8",
".git/objects/61/25401ce154ceecb8f7bc3a9602c14f405a94fe": "2b8141025e72859d6f41b0cd5d0919c9",
".git/objects/66/45231a199c967f96c938f0b52ed3fa896bc372": "699bf88d7b20616e5db91c266b98d043",
".git/objects/6b/37325cb3a69dc2f8d9f287ba8a48d1fba84f6c": "a9510b9413f3e5ccf856508e449da19f",
".git/objects/71/0d1693c3bb457b7377eeaec32880a1b007af9b": "91eb2972e1419a37ffa9c1a3d03226ff",
".git/objects/77/e58760cbcba27e78c6739607c83aa56f55f9ed": "e3a854772bddd6793f54067b2b9bea5b",
".git/objects/78/2cf12cafaf203d8a12b4a7d509f6c3bfda3af7": "4614648563065f488ccc9eac834e19e1",
".git/objects/7b/f959fcc4120674b185371dfd22c6dfc6bed381": "ecb0f895fb06192e4b6fed6183c1496b",
".git/objects/7d/814359aff63a93f47c4e6a924ca2dbd15ed925": "e3f3c461fd8d16eb91a28857a0e3a2ce",
".git/objects/81/f0e46c8028292e621b3ffabe11e9d878a9f90c": "6fe1f966ffef82d98dc89e17f989c486",
".git/objects/85/f11c03cb81b9a9f5dce4f49ef81c54972c7f41": "2d3f77c8a9e857e7bf571736ba991310",
".git/objects/93/1412891522263769d0b42297d9101c4a4c26dd": "4f5e85e9926cc7e7f39d0da6cd55486e",
".git/objects/93/2df4ae2c3cb34a716e21b478590eecaa2ae295": "e299ba2e68d97d0f661cc8ddccf9787a",
".git/objects/a5/0f63296359183a79aec747244fa1185c27b860": "a7456215e69f7f5f9349266360b2a3f8",
".git/objects/a5/7b2e999045a185f28ba211643f8d4535057e30": "018219273c065162f9d3d7b8d5dafdb2",
".git/objects/a8/3a17d54b6dc2156c855c6580301cefc9c8d017": "6525101be8d70b808a809af9c83fa4ad",
".git/objects/aa/7cc029082ba129b8a7ecbac0e7d3a396466c51": "f03c79c10e0f4c2bf6eca1bb511eb632",
".git/objects/ab/dc536e0432614864ee8491af0ce381e8498e70": "e51105af6252d67f99b951567ffc6192",
".git/objects/ae/f609a1262eecb8f12fae1e7c239750b5f31a13": "a13dfa8f11d37e1923dd70250b95da9a",
".git/objects/b7/d6722eb75e12322f892fc1b95bfd56ded8b54c": "88570dc09e4354733ad71029046dd8d3",
".git/objects/bf/310849c93749131f16834b839a0e0a8d76cbba": "97a955a456905549c65c75ce1eb96546",
".git/objects/bf/7d9257a4e113ff824fc5eaea2cd64cfe48cab4": "73f565104845037c88c50641f7d96474",
".git/objects/c0/42f36b99b4ca5506adb870bfe6fbc3a4e28ffa": "15b9d366fd750074dd8ed2b6c15d2a41",
".git/objects/c2/a728121cc94290e0e8dbde82b1e5125d5465a6": "f2989bf1405fb660305820683b8ee53c",
".git/objects/d2/e92a6818cd0b93caa07c6424e792cfae72b22f": "939d36282ddc3eb596d9ce71bb4591eb",
".git/objects/d4/1437b99e62455d3c377a693c1eca5ba8505b7f": "9553e03344b770ad0280f1679afc6930",
".git/objects/dc/67dd363b44f82d30dc9bd7cf661744278f4dd3": "fedc759dd4ef5de29d7b523f1c03f1a6",
".git/objects/dc/ac6ce0db483e4f508ce7141b94c2ad6e84e1b9": "46364891a31c9c112bd12ce75728d6b9",
".git/objects/dd/43db65edcbfd810943d4270e20d3703447c26d": "b41f2c4cbaf5f3425cc1445d4e1e098e",
".git/objects/e1/45b9f2728e1b0a4ee46020da6874d503d104c4": "7157c6061e0db4bc7b20461ea5770aa4",
".git/objects/e6/74cc0c0970ded9bdc13c90f399174a263febbc": "405937980761f8f8e14980ef3d5027d7",
".git/objects/f2/5787c93ad00665f0f797a43ab397f0628a273e": "59e425d1456034072d902c75d18ec75f",
".git/objects/f9/acfb9add617e2d7a300a4bb9f1162f19fbe8db": "0146e01f93875c1ff3b92f71106cb50c",
".git/objects/fe/c934b5bd5514e3b05dec77acf7ab8c9e835eaf": "bda61cc0782cf62add6b5237aae155ce",
".git/refs/heads/main": "bb7abaf2ee6adaff732db904cb694ddd",
".git/refs/remotes/origin/main": "bb7abaf2ee6adaff732db904cb694ddd",
"assets/AssetManifest.json": "fcefa41058dfd42b8666e7ff1cfb5512",
"assets/assets/icons/github.png": "6740a561e3a1fca6ff4a8419f2540372",
"assets/assets/icons/instagram.png": "fa90e1e7734e5bef1193daca074ad67c",
"assets/assets/icons/link.png": "b733b8199a2c185b6642d80d539e309d",
"assets/assets/icons/linkedin.png": "1605cd36a25c98249cf421b145690992",
"assets/assets/icons/medium.png": "183c80a98abf028717271bcbc70a1876",
"assets/assets/icons/playstore.png": "6991b5b43025c69ee381ad25db968ef9",
"assets/assets/icons/twitter.png": "3485defb936b804b535d38e9b59c7f90",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/NOTICES": "efd40006cff91fbe5be8b98e76a7f894",
"assets/packages/flutter_signin_button/assets/logos/2.0x/facebook_new.png": "83bf0093719b2db2b16e2839aee1069f",
"assets/packages/flutter_signin_button/assets/logos/2.0x/google_dark.png": "937022ea241c167c8ce463d2ef7ed105",
"assets/packages/flutter_signin_button/assets/logos/2.0x/google_light.png": "8f10eb93525f0c0259c5e97271796b3c",
"assets/packages/flutter_signin_button/assets/logos/3.0x/facebook_new.png": "12531aa3541312b7e5ddd41223fc60cb",
"assets/packages/flutter_signin_button/assets/logos/3.0x/google_dark.png": "ac553491f0002941159b405c2d37e8c6",
"assets/packages/flutter_signin_button/assets/logos/3.0x/google_light.png": "fe46d37e7d6a16ecd15d5908a795b4ee",
"assets/packages/flutter_signin_button/assets/logos/facebook_new.png": "e1dff5c319a9d7898aee817f624336e3",
"assets/packages/flutter_signin_button/assets/logos/google_dark.png": "c32e2778b1d6552b7b4055e49407036f",
"assets/packages/flutter_signin_button/assets/logos/google_light.png": "f71e2d0b0a2bc7d1d8ab757194a02cac",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "00bb2b684be61e89d1bc7d75dee30b58",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "4b6a9b7c20913279a3ad3dd9c96e155b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dffd9504fcb1894620fa41c700172994",
"favicon.png": "98e47992461b455e390f74cbaf388336",
"icons/Icon-192.png": "c4e4b2c961c891ed16e38d2bc437e7a1",
"icons/Icon-512.png": "f9c1b95f4e640d11554e4b1c579a4f58",
"index.html": "432510fce40b0a68c6aa9555cf056832",
"/": "432510fce40b0a68c6aa9555cf056832",
"main.dart.js": "979cf002c474f612b03b4e327bbfa35f",
"manifest.json": "32f1079169c358f1bc164ecc819ae42d",
"version.json": "b9ab7b982ebf79c9dbc32df6ff2301e7"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
