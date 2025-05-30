# FROM jenkins/jenkins:lts

# USER root

# RUN apt-get update && apt-get install -y docker.io && \
#     usermod -aG docker jenkins

# USER jenkins


FROM jenkins/jenkins:lts

USER root

# Install Docker CLI and Node.js (LTS)
RUN apt-get update && \
    apt-get install -y docker.io curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    groupadd docker || true && \
    usermod -aG docker jenkins && \
    node -v && npm -v

USER jenkins

