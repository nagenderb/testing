import ipaddress


def is_valid_ip(address):
    """Return True when address is a valid IPv4 or IPv6 address."""
    try:
        ipaddress.ip_address(address)
        return True
    except ValueError:
        return False


def is_valid_ipv4(address):
    """Return True when address is a valid IPv4 address."""
    try:
        return isinstance(ipaddress.ip_address(address), ipaddress.IPv4Address)
    except ValueError:
        return False

def is_valid_ipv6(address):
    """Return True when address is a valid IPv6 address."""
    try:
        return isinstance(ipaddress.ip_address(address), ipaddress.IPv6Address)
    except ValueError:
        return False

