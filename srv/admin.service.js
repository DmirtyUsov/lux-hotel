const cds = require('@sap/cds');

const MAX_ROOMS_ON_FLOOR = 6;

const { Rooms } = cds.entities('admin');

const logger = cds.log('lux-hotel-admin');

module.exports = cds.service.impl(function () {
  this.before('CREATE', Rooms, async (req) => {
    const isEnough = await checkMaxRoomsOnFloor(req);

    if (isEnough) {
      req.error(400, `The floor already has ${MAX_ROOMS_ON_FLOOR} rooms.`);
    }
  });
});

const checkMaxRoomsOnFloor = async (req) => {
  const { to_Floor_code } = req.data;

  const { totalRoomsOnFloor } = await SELECT.one
    .columns(`count(*) as totalRoomsOnFloor`)
    .from(Rooms)
    .where({ to_Floor_code });

  logger(`Rooms on ${to_Floor_code} Floor: ${totalRoomsOnFloor}`);

  return MAX_ROOMS_ON_FLOOR < totalRoomsOnFloor;
};
