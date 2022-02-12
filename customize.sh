if [[ ! "$SHELLOPTS" =~ "pipefail" ]]; then
  set -o pipefail
  PIPEFAIL=0
else
  PIPEFAIL=1
fi
system_path="${MODPATH}/system"
mkdir -vp "${system_path}"
url2down="https://github.com/raven428/magisk-laosime-blob/releases/download/v1.0.0/api${API}${ARCH}.txz"
ui_print "Downloading [${url2down}]:"
curl -Lsfo - "${url2down}" | unxz -c |
  tar -xv -f - -C "${system_path}" ||
  abort "Your API [${API}] or arch [${ARCH}] not found at https://github.com/raven428/magisk-laosime-blob/releases/tag/v1.0.0/ or failed to download. Aborting…"
if [[ "$PIPEFAIL" -eq 0 ]]; then
  set +o pipefail
fi
