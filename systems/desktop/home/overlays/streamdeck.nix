# Config Overrides for StreamDeck
final: prev: {
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (
      python-final: python-prev: {
        streamdeck = python-prev.streamdeck.overrideAttrs (oldAttrs: {
          src = prev.fetchFromGitHub {
            owner = "karstlok";
            repo = "python-elgato-streamdeck";
            rev = "3dcd7c5d065c14137fe9dd3bb07b6cc60f34361f";
            hash = "sha256-IEUo1YIC1Dc2tOEvApkkPYExqZRn8W3kLKOuUGDYYvw=";
          };
          patches = [
            (final.substituteAll {
              src = ./streamdeck-hardcode-libusb.patch;
              libusb = "${final.hidapi}/lib/libhidapi-libusb${final.stdenv.hostPlatform.extensions.sharedLibrary}";
            })
          ];
        });
      }
    )
  ];
}
