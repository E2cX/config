function wSend(pu112)
    task.spawn(function()
        local v113 = game:GetService("HttpService"):JSONEncode(pu112)
        local v114 = {
            ["content-type"] = "application/json"
        }
        Send = http_request or request or (HttpPost or syn.request)
        if getgenv().config.Webhooks["Toggle Webhook"] and getgenv().config.Webhooks["Link Webhook"] ~= "" then
            Send({
                Url = getgenv().config.Webhooks["Link Webhook"],
                Body = v113,
                Method = "POST",
                Headers = v114
            })
        end
    end)
end

function wHop()
    local v115 = {
        content = ""
    }
    local v116 = {}
    local v117 = {
        author = {
            name = game.Players.LocalPlayer.Name,
            icon_url = "https://static.wikia.nocookie.net/2840931c-afb4-482b-a364-18b968adac58"
        },
        color = 16228095,
        title = "SAIKI WEBHOOK BOUNTY - Auto Bounty",
        description = "Joining new server...",
        thumbnail = {
            url = "https://cdn.discordapp.com/attachments/937563909236326400/1124332695581888522/Untitled23_20230628115032.png"
        },
        image = {
            url = "https://cdn.discordapp.com/attachments/1127179277935316994/1130136051604799488/image.png"
        },
        footer = {
            text = "SAIKI WEBHOOK BOUNTY "
        },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }
    __set_list(v116, 1, { v117 })
    v115.embeds = v116
    wSend(v115)
end

function wRecv()
    local v118 = {
        content = ""
    }
    local v119 = {}
    local v120 = {
        title = "SAIKI WEBHOOK BOUNTY - Auto Bounty",
        color = 16228095,
        author = {
            name = game.Players.LocalPlayer.Name,
            icon_url = "https://static.wikia.nocookie.net/2840931c-afb4-482b-a364-18b968adac58"
        },
        fields = {
            {
                name = "Player:",
                value = "||" .. lp.Name .. "||",
                inline = false
            },
            {
                name = "Server Id:",
                value = game.JobId,
                inline = false
            }
        },
        footer = {
            text = "SAIKI WEBHOOK BOUNTY "
        },
        image = {
            url = "https://cdn.discordapp.com/attachments/1127179277935316994/1130136051604799488/image.png"
        },
        thumbnail = {
            url = "https://cdn.discordapp.com/attachments/937563909236326400/1124332695581888522/Untitled23_20230628115032.png"
        },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }
    __set_list(v119, 1, { v120 })
    v118.embeds = v119
    wSend(v118)
end

wRecv()

function format(p121)
    local _, _, v122, v123, v124 = tostring(p121):find("([-]?)(%d+)([.]?%d*)")
    return v122 .. v123:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "") .. v124
end

function wEarn(p125, p126)
    local v127 = {
        content = ""
    }
    local v128 = {}
    local v129 = {
        author = {
            name = game.Players.LocalPlayer.Name,
            icon_url = "https://static.wikia.nocookie.net/2840931c-afb4-482b-a364-18b968adac58"
        },
        title = "SAIKI WEBHOOK BOUNTY - Auto Bounty",
        color = 16228095,
        fields = {
            {
                name = "Player:",
                value = "||" .. game.Players.LocalPlayer.Name .. "||",
                inline = false
            },
            {
                name = "Target:",
                value = p125,
                inline = false
            },
            {
                name = "Bounty Earned:",
                value = format(p126) .. " Bounty",
                inline = false
            },
            {
                name = "Current Bounty:",
                value = format(lp.leaderstats["Bounty/Honor"].Value),
                inline = false
            }
        },
        thumbnail = {
            url = "https://cdn.discordapp.com/attachments/937563909236326400/1124332695581888522/Untitled23_20230628115032.png"
        },
        image = {
            url = "https://cdn.discordapp.com/attachments/1127179277935316994/1130136051604799488/image.png"
        },
        footer = {
            text = "SAIKI WEBHOOK BOUNTY "
        },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }
    __set_list(v128, 1, { v129 })
    v127.embeds = v128
    wSend(v127)
end
