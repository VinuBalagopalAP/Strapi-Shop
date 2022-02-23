module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '0fe79785aed8350773a0711420b2f881'),
  },
});
