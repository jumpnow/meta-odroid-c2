SUMMARY = "Testing some security audit tools"

require console-image.bb

AUDIT_TOOLS = " \
    buck-security \
    checksec \
    checksecurity \
    lynis \
    ncrack \
    nikto \
    oe-scap \
    python3-scapy \
"

IMAGE_INSTALL += " \
    ${AUDIT_TOOLS} \
"

export IMAGE_BASENAME = "audit-image"
