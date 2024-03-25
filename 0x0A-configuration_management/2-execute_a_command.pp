# command kill killmenow
exec { 'pkill':
  path    => '/bin/',
  command => 'pkill killmenow',
  }

