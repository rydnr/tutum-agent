#!/bin/bash
set -e

: ${TUTUM_TOKEN:?"-e TUTUM_TOKEN is not set. This is the hex value shown in Bring Your Own Node dialog."}

# from run.sh
if [ ! -f /.root_pw_set ]; then
	/set_root_pw.sh
fi
# /usr/sbin/sshd -D

curl -Ls https://files.tutum.co/scripts/install-agent.sh | sudo sh -s ${TUTUM_TOKEN} || true

exec "$@"
