month = {
  march: 30,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 31,
  september: 30,
  october: 31,
  november: 30,
  december: 31,
  january: 30,
  february: 28
}

month.each { |key, value| puts key if value == 30 }
