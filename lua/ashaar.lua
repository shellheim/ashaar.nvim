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
		-- Spacing between couplet and author, don't why chaining two '\n' doesn't work on line 49.
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
