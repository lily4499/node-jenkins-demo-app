FROM jenkins/jenkins:lts

USER root

# Install Docker CLI, Node.js, and system tools
RUN apt-get update && \
    apt-get install -y docker.io curl gnupg apt-transport-https software-properties-common

# Install Node.js 18.x
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# ✅ Install kubectl v1.33.0 (hardcoded version)
RUN curl -LO https://dl.k8s.io/release/v1.33.0/bin/linux/amd64/kubectl && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

# Add Jenkins user to docker group
RUN groupadd docker || true && usermod -aG docker jenkins

# Confirm versions
RUN node -v && npm -v && docker --version && kubectl version --client

USER jenkins







# FROM jenkins/jenkins:lts

# USER root

# RUN apt-get update && apt-get install -y docker.io && \
#     usermod -aG docker jenkins

# USER jenkins


# FROM jenkins/jenkins:lts

# USER root

# # Install Docker CLI and Node.js (LTS)
# RUN apt-get update && \
#     apt-get install -y docker.io curl gnupg && \
#     curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
#     apt-get install -y nodejs && \
#     groupadd docker || true && \
#     usermod -aG docker jenkins && \
#     node -v && npm -v

# USER jenkins

