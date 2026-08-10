# Regenerative Biomaterials and Theranostics Laboratory

[![on-push](https://github.com/bioticaresearchgroup/RBTLab/actions/workflows/on-push.yaml/badge.svg)](https://github.com/bioticaresearchgroup/RBTLab/actions/workflows/on-push.yaml)
[![on-pull-request](https://github.com/bioticaresearchgroup/RBTLab/actions/workflows/on-pull-request.yaml/badge.svg)](https://github.com/bioticaresearchgroup/RBTLab/actions/workflows/on-pull-request.yaml)
[![on-schedule](https://github.com/bioticaresearchgroup/RBTLab/actions/workflows/on-schedule.yaml/badge.svg)](https://github.com/bioticaresearchgroup/RBTLab/actions/workflows/on-schedule.yaml)

## Regenerative Biomaterials and Theranostics Lab — Website

Visit **[www.gssailaja.org](https://www.gssailaja.org)** 🚀

Based at the Department of Polymer Science and Rubber Technology, Cochin University of Science and Technology (CUSAT), the lab focuses on biomaterials, nanomedicine, and theranostics.

## Local development

```bash
bundle install
bundle exec jekyll serve --livereload
# or render via Docker
bash .docker/run.sh
```

The `update-citations` workflow maintains `_data/citations.yaml` automatically from ORCID, Google Scholar, and PubMed sources. To enable it, add the `GOOGLE_SCHOLAR_API_KEY` secret to the repository.
