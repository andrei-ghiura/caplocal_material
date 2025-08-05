module.exports = function custom_auth (req, res, next) {
  // do your custom authentication
  console.log('Custom authentication middleware called');
  cds.context.user = new cds.User({
    id: '<user-id>',
    roles: ['<role-a>', '<role-b>'],
    attr: {
      
    }
  })
  cds.context.tenant = '<tenant>'
  next()
}