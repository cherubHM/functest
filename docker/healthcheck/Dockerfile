FROM opnfv/functest-core

ARG BRANCH=master
ARG OPENSTACK_TAG=master
ARG ODL_TAG=85448c9d97b89989488e675b29b38ac42d8674e4

COPY thirdparty-requirements.txt thirdparty-requirements.txt
RUN apk --no-cache add --virtual .build-deps --update \
        python-dev build-base linux-headers libffi-dev openssl-dev && \
    wget -q -O- https://git.openstack.org/cgit/openstack/requirements/plain/upper-constraints.txt?h=$OPENSTACK_TAG | \
        sed -E s/^tempest==+\(.*\)$/-e\ git+https:\\/\\/git.openstack.org\\/openstack\\/tempest@\\1#egg=tempest/ \
        > upper-constraints.txt && \
    wget -q -O- https://git.opnfv.org/functest/plain/upper-constraints.txt?h=$BRANCH | \
        sed -E /#egg=functest/d > upper-constraints.opnfv.txt && \
    pip install --no-cache-dir --src /src -cupper-constraints.txt -cupper-constraints.opnfv.txt \
        -rthirdparty-requirements.txt && \
    git init /src/odl_test && \
    (cd /src/odl_test && \
        git fetch --tags https://git.opendaylight.org/gerrit/p/integration/test.git $ODL_TAG && \
        git checkout FETCH_HEAD) && \
    rm -r /src/odl_test/.git thirdparty-requirements.txt upper-constraints.txt \
        upper-constraints.opnfv.txt && \
    apk del .build-deps
COPY testcases.yaml /usr/lib/python2.7/site-packages/xtesting/ci/testcases.yaml
CMD ["run_tests", "-t", "all"]
