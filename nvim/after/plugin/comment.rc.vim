lua << EOF
require('Comment').setup()

--- для С комментраии только /* */
local ft = require('Comment.ft')
ft.set('c', { '/*%s*/' })

EOF
