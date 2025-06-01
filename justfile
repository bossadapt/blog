REMOTE_USER := "root"
REMOTE_HOST := "138.197.56.84"
REMOTE_PATH := "/var/www/bossadapt.org/blogs"
REMOTE_PATH_BEFORE := "/var/www/bossadapt.org/"

deploy:
    ssh {{REMOTE_USER}}@{{REMOTE_HOST}} "cd {{REMOTE_PATH_BEFORE}} && rm -r -f blogs"
    hugo --baseURL=https://bossadapt.org/blogs/
    rsync -avz public/ {{REMOTE_USER}}@{{REMOTE_HOST}}:{{REMOTE_PATH}}
    ssh {{REMOTE_USER}}@{{REMOTE_HOST}} "systemctl restart nginx.service"