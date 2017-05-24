//
//  EventAPI+Requests.swift
//  Sportivity
//
//  Created by Andrzej Frankowski on 19/04/2017.
//  Copyright © 2017 Sportivity. All rights reserved.
//

import Foundation
import RxSwift
import Wrap
import Result

extension EventsAPI {
    
    static func rx_fetchEvent(_ id: String) -> Observable<Result<Event, APIError>> {
        return EventsAPI
            .fetchEvent(id: id)
            .validatedRequest()
            .rx_responseModel(Event.self)
            .resultifyAPIResponse()
    }
    
    static func rx_fetchEvents(with parameters: EventsParameters) -> Observable<Result<[Event], APIError>> {
        do {
            let dict: WrappedDictionary = try wrap(parameters)
            return EventsAPI
                .fetchEvents(parameters: dict)
                .validatedRequest()
                .rx_responseModelsArray(Event.self, at: "data")
                .resultifyAPIResponse()
        } catch let e {
            let error = APIError.serialization(SerializationError.wrappingError(error: e, type: EventsParameters.self))
            return Observable.just(Result.failure(error))
        }
    }
}
