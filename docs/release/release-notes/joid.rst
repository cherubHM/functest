joid
====

os-nosdn-nofeature-ha
---------------------

====================  ===================  ============  ========  =========
testcase              date                 pod_name      result    jira
====================  ===================  ============  ========  =========
connection_check      2018-04-10 07:53:44  huawei-pod12  PASS
api_check             2018-04-10 08:02:26  huawei-pod12  PASS
snaps_health_check    2018-04-10 08:02:58  huawei-pod12  PASS
vping_ssh             2018-04-10 08:07:19  huawei-pod12  PASS
vping_userdata        2018-04-10 08:08:33  huawei-pod12  PASS
tempest_smoke_serial  2018-04-10 08:23:43  huawei-pod12  FAIL
rally_sanity          2018-04-10 08:27:13  huawei-pod12  FAIL
refstack_defcore      2018-04-10 08:31:39  huawei-pod12  FAIL
patrole               2018-04-10 08:34:58  huawei-pod12  FAIL
snaps_smoke           2018-04-10 09:19:02  huawei-pod12  FAIL      SNAPS-283
neutron_trunk                              huawei-pod12
cloudify_ims          2018-04-10 09:48:24  huawei-pod12  FAIL
vyos_vrouter          2018-04-10 09:53:49  huawei-pod12  FAIL
juju_epc              2018-04-10 09:54:14  huawei-pod12  FAIL
====================  ===================  ============  ========  =========
