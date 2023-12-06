local function main()
	-- Load the couplets from the external file
	local ashaar = require("ashaar_list")

	local authors = {}

	for author, _ in pairs(ashaar) do
		table.insert(authors, author)
	end

	local randomAuthor, couplet

	local line1, line2

	local formattedString

	local function getAuthor()
		local randomAuthorIndex = math.random(1, #authors)
		randomAuthor = authors[randomAuthorIndex]
		return randomAuthor
	end

	local function getCouplet()
		local authorCouplet = ashaar[randomAuthor]
		math.randomseed(os.time())
		local randomCoupletIndex = math.random(1, #authorCouplet)
		couplet = authorCouplet[randomCoupletIndex]
		return couplet
	end

	local function formatCouplet(couplet)
		line1, line2 = string.match(couplet, "^(.-) : (.+)$")
		return line1, line2
	end

	local function formatString(line1, line2, randomAuthor)
		local maxLength = math.max(#line1, #line2)

		local function padToCenter(line, length)
			local padding = math.floor((length - #line) / 2)
			return string.rep(" ", padding) .. line .. string.rep(" ", length - #line - padding)
		end

		-- add '-' before the author's name
		randomAuthor = "- " .. randomAuthor

		-- Center the couplet lines w.r.t the longest line
		local centeredLine1 = padToCenter(line1, maxLength)
		local centeredLine2 = padToCenter(line2, maxLength)
		-- Spacing between couplet and author, don't why chaining two '\n' doesn't work on line 49.
		local centeredAuthor = " \n " .. padToCenter(randomAuthor, maxLength)

		formattedString = " \n " .. centeredLine1 .. " \n " .. centeredLine2 .. "\n" .. centeredAuthor
		return formattedString
	end

	getAuthor()
	getCouplet()
	formatCouplet(couplet)
	formatString(line1, line2, randomAuthor)
	return formattedString
end

return main
