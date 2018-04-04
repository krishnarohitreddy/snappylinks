import cmsclient.client

from oslo_config import cfg

group = cfg.OptGroup(name='cmdb')
opts = [
    cfg.StrOpt('endpoint', default='http://lvs03cmsapi.lvs03.paypalc3.com/cms',
               help='CMDB endpoint'),
    cfg.StrOpt('repo', default='cmsdbtest',
               help='CMDB repo'),
    cfg.StrOpt('path_to_token',
               default=('/home/nobodycam/GitRepos/PayPal/ckrelle/'
                        'Zeus/DummyFile.txt'),
               help='Path to CMDB access token (Used for write access'),
    cfg.StrOpt('initial_query',
               default=('AssetServer[@resourceId =~ "^Serial-" and '
                        '@_lastmodified>date({ts})]'),
               help='initial CMS query.'),
    # cfg.StrOpt('get_asset_server_from_serial_number',
    #           default='AssetServer[@resourceId =~ "^Serial-{}"]',
    #           help='CMS query to get asset_Server from serial number.'),
    cfg.StrOpt('get_asset_server_from_serial_number',
               default='AssetServer[@resourceId="Serial-{}"]',
               help='CMS query to get asset_Server from serial number.'),
    cfg.StrOpt('get_az_from_asset',
               default=('AssetServer[@_oid="{}"].asset.assets!Rack.'
                        'availabilityZone'),
               help='CMS query to retrive AZ via asset.'),
    cfg.StrOpt('get_az_from_nodeserver',
               default='AssetServer[@_oid="{}"].nodeServer.availabilityZone',
               help='CMS query to retrive AZ via NodeServer.'),
    cfg.StrOpt('get_rack_for_node',
               default='AssetServer[@_oid="{}"].asset.assets!Rack',
               help='CMS query to retrive rack via assetServer oid.'),
    cfg.StrOpt('get_asset_from_serial_number',
               default='Asset[@serial="{}"]',
               help='CMS query to retrive asset object via serial number.'),
    cfg.StrOpt('get_node_server_from_serial_number',
               default='NodeServer[@serial="{}"]',
               help='CMS query to retrive node server object via serial number.'),
    cfg.StrOpt('get_asset_from_oid',
               default='Asset[@_oid="{}"]',
               help='CMS query to retrive asset via asset oid.'),
    cfg.StrOpt('get_az_from_serial_number',
               default='Asset[@serial="{}"].assets!Rack.availabilityZone',
               help='CMS query to retrive rack via assetServer oid.'),
    cfg.StrOpt('get_rack_from_serial_number',
               default='Asset[@serial="{}"].assets!Rack',
               help='CMS query to retrive rack via assetServer oid.'),
    cfg.StrOpt('get_rack_from_location',
               default='Rack[@location="{}"]',
               help='CMS query to retrive rack via location.'),
]

CONF = cfg.CONF
CONF.register_group(group)
CONF.register_cli_opts(opts, group=group)

CMDB_CLIENT = None


def get_cmdb_client(force=False):
    global CMDB_CLIENT
    if not CMDB_CLIENT or force:
        with open(CONF.cmdb.path_to_token) as token_file:
            token = token_file.readlines()[0]
        CMDB_CLIENT = cmsclient.client.CMSClient(CONF.cmdb.endpoint,
                                                 CONF.cmdb.repo,
                                                 token)
    return CMDB_CLIENT

def update_cms_obj_by_serial_num(self, object_type, object_id, field, value):
    if object_type == "Asset":
      query = CONF.cmdb.get_asset_from_serial_number.format(serial_number)
    elif object_type == "AssetServer":
      query = CONF.cmdb.get_asset_server_from_serial_number.format(serial_number)
    elif object_type == "NodeServer":
      query = CONF.cmdb.get_node_server_from_serial_number.format(serial_number)
    else:
      raise Exception(object_type, "Object type not recognized")

    cms_obj = self.get_cmdb_client(force=True).full_query(query)

    if not cms_obj:
      raise Exception(serial_number, "Object with ID failed to update Cms")

    new_cms_obj = cms_obj[0]
    new_cms_obj[field] = value

    self.get_cmdb_client.update_object(object_type, new_cms_obj['_oid'], new_cms_obj)
    # exception will be raised if update fails

    return "Success"
