class apt_ubuntu {
    include apt

    $apt_distribution = $::lsbdistcodename
    $apt_mirror_uri = "http://mirror.ox.ac.uk/sites/archive.ubuntu.com/ubuntu/"

    Apt::Source <| |> -> Package <| |>

    apt::source {
        "${apt_distribution}":
            location             => $apt_mirror_uri,
            release    => $apt_distribution,
            repos       => "main";
        "${apt_distribution}-universe":
            location          => $apt_mirror_uri,
            release => $apt_distribution,
            repos    => "universe";
        "${apt_distribution}-multiverse":
            location          => $apt_mirror_uri,
            release => $apt_distribution,
            repos    => "multiverse";
        "${apt_distribution}-security":
            location             => $apt_mirror_uri,
            release    => "${apt_distribution}-security",
            repos       => "main";
        "${apt_distribution}-updates":
            location             => $apt_mirror_uri,
            release    => "${apt_distribution}-updates",
            repos       => "main";
        "${apt_distribution}-backports":
            location             => $apt_mirror_uri,
            release    => "${apt_distribution}-backports",
            repos       => "main";
        "${apt_distribution}-security-universe":
            location             => $apt_mirror_uri,
            release    => "${apt_distribution}-security",
            repos       => "universe";
        "${apt_distribution}-updates-universe":
            location             => $apt_mirror_uri,
            release    => "${apt_distribution}-updates",
            repos       => "universe";
        "${apt_distribution}-backports-universe":
            location             => $apt_mirror_uri,
            release    => "${apt_distribution}-backports",
            repos       => "universe";
    }
}
