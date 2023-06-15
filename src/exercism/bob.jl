function bob(stimulus::AbstractString)
    isYelling = stimulus == uppercase(stimulus)
    isSilence = strip(stimulus) == ""
    isQuestion = isSilence ? false : strip(stimulus)[end] == '?'
    isAudible = any(isletter, stimulus)
    
    if isSilence "Fine. Be that way!"
    elseif isQuestion && isYelling && isAudible "Calm down, I know what I'm doing!"
    elseif isQuestion "Sure."
    elseif isYelling && isAudible "Whoa, chill out!"
    else "Whatever." end
end
