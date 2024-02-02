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
		math.randomseed(os.time())
		local randomAuthorIndex = math.random(#authors)
		randomAuthor = authors[randomAuthorIndex]
		return randomAuthor
	end

	local function getCouplet()
		local authorCouplet = ashaar[randomAuthor]
		math.randomseed(os.time())
		local randomCoupletIndex = math.random(#authorCouplet)
		couplet = authorCouplet[randomCoupletIndex]

		-- Change John_Smith to John Smith/format author's name after using in authorCouplet
		if string.find(randomAuthor, "_") then
			randomAuthor = randomAuthor.gsub(randomAuthor, "_", " ")
		end

		return couplet
	end

	local function formatCouplet(string)
		line1, line2 = string.match(string, "^(.-) : (.+)$")
		return line1, line2
	end

	local function formatString(firstLine, secondLine, author)
		local maxLength = math.max(#firstLine, #secondLine)

		local function padToCenter(line, length)
			local padding = math.floor((length - #line) / 2)
			return string.rep(" ", padding) .. line .. string.rep(" ", length - #line - padding)
		end

		-- add '-' before the author's name
		author = "- " .. author

		-- Center the couplet lines w.r.t the longest line
		local centeredLine1 = padToCenter(firstLine, maxLength)
		local centeredLine2 = padToCenter(secondLine, maxLength)

		-- Spacing between couplet and author, don't know why chaining two '\n's doesn't work on line 49.
		local centeredAuthor = " \n " .. padToCenter(author, maxLength)

		formattedString = " \n " .. centeredLine1 .. " \n " .. centeredLine2 .. "\n" .. centeredAuthor
		return formattedString
	end
	-- Call everything and return the actual text to display
	getAuthor()
	getCouplet()
	formatCouplet(couplet)
	formatString(line1, line2, randomAuthor)
	return formattedString
end

return main
