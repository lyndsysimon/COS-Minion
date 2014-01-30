module.exports = (robot) ->
    robot.respond /who is (.+)\?/i, (msg) ->
        userId = msg.match[1]
        url = 'https://osf.io/api/v1/profile/' + userId + '/'
        robot.http(url)
            .get() (err, res, body) ->
                if err
                    msg.send "Error: #{err}"
                data = JSON.parse(body)
                msg.send "User #{userId} is known to humans as \"#{data.profile.fullname}\""
    robot.respond /what is (.+)\?/i, (msg) ->
        nodeId = msg.match[1]
        url = 'https://osf.io/api/v1/project/' + nodeId + '/'
        robot.http(url)
            .get() (err, res, body) ->
                if err
                    msg.send "Error: #{err}"
                data = JSON.parse(body)
                msg.send "Project ID #{nodeId} is titled \"#{data.node.title}\""