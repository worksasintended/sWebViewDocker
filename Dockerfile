FROM base/archlinux
MAINTAINER Marc Marschall marc@marschall.net
RUN pacman --noconfirm -Syyu
RUN pacman --noconfirm -S wt boost cmake make gcc git
RUN chmod 640 /etc/sudoers && echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && chmod 440 /etc/sudoers && useradd -m -p123123 -G wheel yaourt
RUN sudo -u yaourt rm -rf /tmp/package-query && \
    sudo -u yaourt rm -rf /tmp/yaourt && \
    cd /tmp && \
    sudo -u yaourt git clone https://aur.archlinux.org/package-query.git && \
    cd /tmp/package-query && \
    yes | sudo -u yaourt makepkg -si && \
    cd .. && \
    sudo -u yaourt git clone https://aur.archlinux.org/yaourt.git && \
    cd /tmp/yaourt && \
    yes | sudo -u yaourt makepkg -si && \
    cd .. && \
    echo 'EXPORT=2' >> /etc/yaourtrc && \
    sudo -u yaourt yaourt --version
RUN echo 'MAKEFLAGS="-j16"' >> /etc/makepkg.conf
RUN sudo -u yaourt yaourt -S --noconfirm slurm 
RUN sudo -u yaourt yaourt -S --noconfirm slurm-llnl
ADD init.sh /
ENTRYPOINT [/init.sh]
