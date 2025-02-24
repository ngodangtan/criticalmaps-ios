import Foundation

// MARK: Live

public extension FileClient {
  static var live: Self {
    let documentDirectory = FileManager.default
      .urls(for: .documentDirectory, in: .userDomainMask)
      .first!

    return Self(
      delete: { fileName in
        try? FileManager.default.removeItem(
          at:
            documentDirectory
            .appendingPathComponent(fileName)
            .appendingPathExtension(fileExtension)
        )
      },
      load: { fileName in
        try Data(
          contentsOf:
            documentDirectory
            .appendingPathComponent(fileName)
            .appendingPathExtension(fileExtension)
        )
      },
      save: { fileName, data in
        _ = try? data.write(
          to:
            documentDirectory
            .appendingPathComponent(fileName)
            .appendingPathExtension(fileExtension)
        )
      }
    )
  }
}

let fileExtension = "json"
