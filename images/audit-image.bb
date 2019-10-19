SUMMARY = "Testing some security audit tools"

require console-image.bb

AUDIT_TOOLS = " \
    buck-security \
    checksecurity \
    lynis \
"

IMAGE_INSTALL += " \
    ${AUDIT_TOOLS} \
"

export IMAGE_BASENAME = "audit-image"
