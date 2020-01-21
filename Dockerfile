FROM jupyter/scipy-notebook
RUN conda install --quiet --yes -c anaconda -c conda-forge -c plotly \
        plotly=4.4.1 \
        jupyter_contrib_nbextensions \
        vaex \
    && conda clean --all -f -y \
    && jupyter lab build  \
    && npm cache clean --force \
    && rm -rf $CONDA_DIR/share/jupyter/lab/staging \
    && rm -rf /home/$NB_USER/.cache/yarn \
    && rm -rf /home/$NB_USER/.node-gyp \
    && rm -rf /home/$NB_USER/.cache/pip \
    && fix-permissions $CONDA_DIR \
    && fix-permissions /home/$NB_USER
