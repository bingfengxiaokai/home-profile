export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64

export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:/home2/zoukai/bin/:$PATH

export USE_CCACHE=1
#export MANPATH=$HOME/tool/mainBook/

tmux_init()
{
	tmux new-session -s "kumu" -d -n "local"    # 开启一个会话
    tmux new-window -n "other"                  # 开启一个窗口
    tmux split-window -h                        # 开启一个竖屏
    tmux split-window -v "top"                  # 开启一个横屏,并执行top命令
    tmux -2 attach-session -d                   # tmux -2强制启用256color，连接已开启的tmux
}

if which tmux 2>&1 >/dev/null; then
    test -z "$TMUX" && (tmux attach || tmux_init)
fi
