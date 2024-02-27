local sha2 = require("sha2")

function generatePassword(length)
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()"
    local password = ""
    
    for i = 1, length do
        local randomIndex = math.random(1, #charset)

        password = password .. string.sub(charset, randomIndex, randomIndex)
    end
    
    return password
end

function evaluatePasswordStrength(password)
    local length = #password
    if length < 6 then
        return "Very weak"
    elseif length < 8 then
        return "Weak"
    elseif length < 10 then
        return "Average"
    elseif length < 12 then
        return "Strong"
    else
        return "Very Strong"
    end
end

function handleArgument()
    local length = io.read("*n")    
    local password = generatePassword(length)
    local strength = evaluatePasswordStrength(password)
    local encrypt = sha2.sha256(password)

    if length == 0 then
        print("This not possible, you need at least one caractere in your password")
    else
        print("Generated password : " .. password)
        print("Password strength : " .. strength)
        print("Encrypted password in SHA-256 : " .. encrypt)
    end
end

function main()
    io.write("Write the password length : ")
    handleArgument()
end

main()