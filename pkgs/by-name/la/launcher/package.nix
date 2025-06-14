{
  lib,
  fetchFromGitHub,
  rustPlatform,
  perl,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "launcher";
  version = "0.10.10";

  src = fetchFromGitHub {
    owner = "iw4x";
    repo = "launcher";
    tag = "v${finalAttrs.version}";
    hash = "sha256-VJxOkgk96DnmnlBh5jDFjKVDv7eMtx8RHg7qn0gQpaU=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-nAqT4lkn9H9Yh87Ud+GtRAwgoFbAZNhJtWq2GgrcFbk=";

  nativeBuildInputs = [ perl ];

  meta = {
    description = "Official launcher for the IW4x mod";
    longDescription = "IW4x allows you to relive Call of Duty: Modern Warfare 2 (2009) in a secure environment with expanded modding capabilites";
    homepage = "https://iw4x.dev";
    changelog = "https://github.com/iw4x/launcher/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ andrewfield ];
    mainProgram = "iw4x-launcher";
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
  };
})
