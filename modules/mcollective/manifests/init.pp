class mcollective {
  # Install
  package {'mcollective':
    ensure => latest,
    require => service['activemq']
  }

  # Run
  service {'mcollective':
    ensure  => running,
    enable  => true,
    require => Package['mcollective'],
  }

  # Restart the service when any settings change
  #Package['mcollective'] -> Mcollective::Setting <| |> ~> Service['mcollective']
}
