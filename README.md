<div align="center">
  <h1>Carviz Capacitor Microphone</h1>
  <h2>@getcarviz/capacitor-microphone</h2>

This Microphone API provides the ability to interact with the microphone and record Audio


[![Maintenance](https://img.shields.io/badge/maintained-yes-green.svg)](https://github.com/GetCarviz/capacitor-microphone/graphs/commit-activity)
</div>
  
## Platform support
|              | iOS                  | Android            | Web                |
| ------------ |--------------------- | ------------------ | ------------------ |
| Availability | :heavy_check_mark:   | :heavy_check_mark: | :x:                |
| Encoding     | kAudioFormatMPEG4AAC | MPEG_4 / AAC       | :x:                |
| Extension    | .m4a                 | .m4a               | :x:                |


## Installation

This package is published on GitHub Packages, which always requires a token, even to install.

1. Give your GitHub CLI token access to packages, then expose it to npm/pnpm (e.g. in `~/.zshrc`):

   ```bash
   gh auth refresh -s write:packages      # write:packages includes read
   export NODE_AUTH_TOKEN="$(gh auth token 2>/dev/null)"
   ```

2. Add an `.npmrc` to the consuming project (safe to commit, it only references the variable):

   ```
   @getcarviz:registry=https://npm.pkg.github.com
   //npm.pkg.github.com/:_authToken=${NODE_AUTH_TOKEN}
   ```

3. Install:

   ```
   npm install @getcarviz/capacitor-microphone
   ```

Check your setup with `npm whoami --registry=https://npm.pkg.github.com`. In GitHub Actions, use `NODE_AUTH_TOKEN: ${{ secrets.GITHUB_TOKEN }}` with `permissions: packages: read`, and grant the consuming repo read access in the package settings (**Manage Actions access**).

## iOS

iOS requires the following usage description to be added and filled out for your app in `Info.plist`:

- `NSMicrophoneUsageDescription` (`Privacy - Microphone Usage Description`)

Read about [Configuring `Info.plist`](https://capacitorjs.com/docs/ios/configuration#configuring-infoplist) in the [iOS Guide](https://capacitorjs.com/docs/ios) for more information on setting iOS permissions in Xcode.

## Android

This API requires the following permission to be added to your `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.RECORD_AUDIO" />
```

The RECORD_AUDIO permission is for recording audio.

Read about [Setting Permissions](https://capacitorjs.com/docs/android/configuration#setting-permissions) in the [Android Guide](https://capacitorjs.com/docs/android) for more information on setting Android permissions.


## API

<docgen-index>

* [`checkPermissions()`](#checkpermissions)
* [`requestPermissions()`](#requestpermissions)
* [`startRecording()`](#startrecording)
* [`stopRecording()`](#stoprecording)
* [Interfaces](#interfaces)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### checkPermissions()

```typescript
checkPermissions() => Promise<PermissionStatus>
```

Checks microphone permission

**Returns:** <code>Promise&lt;<a href="#permissionstatus">PermissionStatus</a>&gt;</code>

**Since:** 0.0.3

--------------------


### requestPermissions()

```typescript
requestPermissions() => Promise<PermissionStatus>
```

Requests microphone permission

**Returns:** <code>Promise&lt;<a href="#permissionstatus">PermissionStatus</a>&gt;</code>

**Since:** 0.0.3

--------------------


### startRecording()

```typescript
startRecording() => Promise<void>
```

Starts recoding session if no session is in progress

**Since:** 0.0.3

--------------------


### stopRecording()

```typescript
stopRecording() => Promise<AudioRecording>
```

Stops recoding session if one is in progress

**Returns:** <code>Promise&lt;<a href="#audiorecording">AudioRecording</a>&gt;</code>

**Since:** 0.0.3

--------------------


### Interfaces


#### PermissionStatus

| Prop             | Type                                                                            |
| ---------------- | ------------------------------------------------------------------------------- |
| **`microphone`** | <code><a href="#microphonepermissionstate">MicrophonePermissionState</a></code> |


#### AudioRecording

| Prop               | Type                | Description                                                                                                     | Since |
| ------------------ | ------------------- | --------------------------------------------------------------------------------------------------------------- | ----- |
| **`base64String`** | <code>string</code> | The base64 encoded string representation of the audio file.                                                     | 0.0.3 |
| **`dataUrl`**      | <code>string</code> | The url starting with 'data:audio/aac;base64,' and the base64 encoded string representation of the audio file.  | 0.0.3 |
| **`path`**         | <code>string</code> | platform-specific file URL that can be read later using the Filesystem API.                                     | 0.0.3 |
| **`webPath`**      | <code>string</code> | webPath returns a path that can be used to set the src attribute of an audio element can be useful for testing. | 0.0.3 |
| **`duration`**     | <code>number</code> | recoding duration in milliseconds                                                                               | 0.0.3 |
| **`format`**       | <code>string</code> | file extension (only .m4a supported on this version)                                                            | 0.0.3 |
| **`mimeType`**     | <code>string</code> | file encoding "audio/aac" (kAudioFormatMPEG4AAC for iOS) (MPEG_4 / AAC for Android)                             | 0.0.3 |


### Type Aliases


#### MicrophonePermissionState

<code><a href="#permissionstate">PermissionState</a> | 'limited'</code>


#### PermissionState

<code>'prompt' | 'prompt-with-rationale' | 'granted' | 'denied'</code>

</docgen-api>

## Publishing

Releases are published to GitHub Packages by the **Publish Released Package** workflow, using `GITHUB_TOKEN`.

1. Bump `version` in `package.json` (e.g. `npm version patch --no-git-tag-version`) and merge it into `main`.
2. Create a GitHub release with the matching tag (e.g. `v8.0.1`) on `main`. Leave **Set as a pre-release** unchecked: the workflow only runs on full releases.
3. Check that the workflow passes and that the new version shows up under **Packages** on the repo page.

A published version can't be overwritten: fix forward with a new version.

### Testing a pre-release

To try a build without using up the final version number, publish a pre-release from your machine (with the `.npmrc` and token from [Installation](#installation)):

```bash
npm version 8.0.1-beta.0 --no-git-tag-version   # next attempt: npm version prerelease --preid beta --no-git-tag-version
npm install --ignore-scripts
npm publish --tag beta                           # prepublishOnly builds dist/ first
git restore package.json package-lock.json README.md
```

`^8.0.1` ranges never resolve to a pre-release; install it explicitly with `@getcarviz/capacitor-microphone@beta`.
