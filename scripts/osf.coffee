module.exports = (robot) ->
    robot.respond /look up user (.+)/i, (msg) ->
        userId = msg.match[1]
        url = 'https://osf.io/api/v1/profile/' + userId + '/'
        robot.http(url)
            .get() (err, res, body) ->
                if err
                    msg.send "Error: #{err}"
                msg.send body
                data = JSON.parse(body)
                msg.send "The organic life-form #{userId} is known to humans as \"#{data.profile.fullname}\""