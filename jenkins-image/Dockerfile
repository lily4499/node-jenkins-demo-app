FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y docker.io && \
    usermod -aG docker jenkins

USER jenkins


# FROM jenkins/jenkins:lts

# USER root

# RUN apt-get update && apt-get install -y docker.io && \
#     groupadd docker || true && \
#     usermod -aG docker jenkins

# USER jenkins

