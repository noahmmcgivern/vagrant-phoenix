make:
	make wkdir up image

up:
	vagrant up

destroy:
	vagrant snapshot delete NEW; vagrant destroy -f

ssh:
	vagrant ssh

freeze:
	vagrant suspend

image:
	vagrant snapshot save NEW || exit 0

restore:
	vagrant snapshot restore NEW

wkdir:
	mkdir -p ./src
