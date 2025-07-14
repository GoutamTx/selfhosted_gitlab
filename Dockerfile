version: '3.8'

services:
  gitlab:
    image: gitlab/gitlab-ce:latest
    container_name: gitlab
    restart: always
    hostname: 'gitlab.goutamgoyal.online'
    environment:
      GITLAB_OMNIBUS_CONFIG: |version: '3.8'

services:
  gitlab:
    image: gitlab/gitlab-ce:latest
    container_name: gitlab
    restart: always
    hostname: 'gitlab.goutamgoyal.online'
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        external_url 'https://gitlab.goutamgoyal.online'
        
        # SSL Configuration
        nginx['redirect_http_to_https'] = true
        nginx['ssl_certificate'] = "/etc/letsencrypt/live/gitlab.goutamgoyal.online/fullchain.pem"
        nginx['ssl_certificate_key'] = "/etc/letsencrypt/live/gitlab.goutamgoyal.online/privkey.pem"
        
        # GitLab configuration
        gitlab_rails['gitlab_shell_ssh_port'] = 2222
        gitlab_rails['time_zone'] = 'UTC'
        
        
        # Performance settings
        postgresql['shared_buffers'] = "256MB"
        postgresql['max_connections'] = 200
        
        # Backup settings
        gitlab_rails['backup_keep_time'] = 604800
        
    ports:
      - '80:80'
      - '443:443'
      - '2222:22'
    volumes:
      - '/opt/gitlab/config:/etc/gitlab'
      - '/opt/gitlab/logs:/var/log/gitlab'
      - '/opt/gitlab/data:/var/opt/gitlab'
      - '/etc/letsencrypt:/etc/letsencrypt:ro'
    shm_size: '256m'
        external_url 'https://gitlab.goutamgoyal.online'
        
        # SSL Configuration
        nginx['redirect_http_to_https'] = true
        nginx['ssl_certificate'] = "/etc/letsencrypt/live/gitlab.goutamgoyal.online/fullchain.pem"
        nginx['ssl_certificate_key'] = "/etc/letsencrypt/live/gitlab.goutamgoyal.online/privkey.pem"
        
        # GitLab configuration
        gitlab_rails['gitlab_shell_ssh_port'] = 2222
        gitlab_rails['time_zone'] = 'UTC'
        
        # Disable container registry for now
        gitlab_rails['registry_enabled'] = false
        
        # Performance settings
        postgresql['shared_buffers'] = "256MB"
        postgresql['max_connections'] = 200
        
        # Backup settings
        gitlab_rails['backup_keep_time'] = 604800
        
    ports:
      - '80:80'
      - '443:443'
      - '2222:22'
    volumes:
      - '/opt/gitlab/config:/etc/gitlab'
      - '/opt/gitlab/logs:/var/log/gitlab'
      - '/opt/gitlab/data:/var/opt/gitlab'
      - '/etc/letsencrypt:/etc/letsencrypt:ro'
    shm_size: '256m'
