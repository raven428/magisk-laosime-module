if [[ ! "$SHELLOPTS" =~ "pipefail" ]]; then
  set -o pipefail
  PIPEFAIL=0
else
  PIPEFAIL=1
fi

system_path="${MODPATH}/system"
mkdir -vp "${system_path}"
url2down="https://github.com/raven428/magisk-laosime-blob/raw/master/api${API}${ARCH}.txz"
ui_print "Downloading [${url2down}]:"
curl -Lsfo - "${url2down}" | unxz -c |
  tar -xv -f - -C "${system_path}" ||
  abort "Your API [${API}] or arch [${ARCH}] not found at https://github.com/raven428/magisk-laosime-blob/ or failed to download. Aborting…"

if [[ "$PIPEFAIL" -eq 0 ]]; then
  set +o pipefail
fi
