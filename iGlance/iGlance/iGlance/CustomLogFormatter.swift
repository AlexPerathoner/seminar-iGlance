//  Copyright (C) 2020  D0miH <https://github.com/D0miH> & Contributors <https://github.com/iglance/iGlance/graphs/contributors>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

import CocoaLumberjack

class CustomLogFormatter: NSObject, DDLogFormatter {
    let dateFormatter: DateFormatter

    override init() {
        dateFormatter = DateFormatter()
        dateFormatter.formatterBehavior = .behavior10_4
        dateFormatter.dateFormat = "yy-MM-dd HH:mm:ss:SSS"

        super.init()
    }

    func format(message logMessage: DDLogMessage) -> String? {
        let dateAndTime = dateFormatter.string(from: logMessage.timestamp)

        var logFlag: String = "Error"
        switch logMessage.flag {
        case DDLogFlag.warning:
            logFlag = "Warning"
        case DDLogFlag.info:
            logFlag = "Info"
        case DDLogFlag.debug:
            logFlag = "Debug"
        case DDLogFlag.verbose:
            logFlag = "Verbose"
        default:
            logFlag = "Error"
        }
        return "\(dateAndTime) \(logFlag): [\(logMessage.fileName):\(logMessage.line)]: \(logMessage.message)"
    }
}
